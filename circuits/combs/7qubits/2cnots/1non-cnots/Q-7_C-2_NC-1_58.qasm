OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[1];
cx q[1], q[4];
cx q[4], q[0];
