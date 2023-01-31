OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[0];
cx q[3], q[4];
cx q[3], q[2];
