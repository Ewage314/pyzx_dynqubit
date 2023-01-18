OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[5], q[3];
x q[6];
x q[5];
cx q[5], q[3];
