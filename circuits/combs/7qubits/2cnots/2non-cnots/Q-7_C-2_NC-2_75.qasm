OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[0], q[2];
x q[3];
x q[0];
cx q[0], q[1];
