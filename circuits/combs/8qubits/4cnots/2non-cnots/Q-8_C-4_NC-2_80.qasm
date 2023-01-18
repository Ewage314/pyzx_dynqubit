OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[0];
cx q[5], q[6];
x q[6];
cx q[6], q[1];
cx q[0], q[7];
cx q[6], q[0];
